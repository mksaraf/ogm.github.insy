from langchain.agents import Tool

def agentTools(retrieval_qa):
    tools = [Tool(
            name='Knowledge Base',
            func=retrieval_qa.run,
            description=(
                'use this tool when answering general knowledge queries to get '
                'more information about the topic from the knowledge base'
            ))]
    return tools